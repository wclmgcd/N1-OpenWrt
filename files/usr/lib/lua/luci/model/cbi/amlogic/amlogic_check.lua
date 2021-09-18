local fs = require "luci.fs"
local http = require "luci.http"
local DISP = require "luci.dispatcher"
local m, b

--Set Default value
default_firmware_repo="cocokfeng/n1-rom"
local amlogic_firmware_repo = luci.sys.exec("uci get amlogic.config.amlogic_firmware_repo 2>/dev/null") or default_firmware_repo

default_firmware_tag="lede"
local amlogic_firmware_tag = luci.sys.exec("uci get amlogic.config.amlogic_firmware_tag 2>/dev/null") or default_firmware_tag

default_firmware_suffix=".img.gz"
local amlogic_firmware_suffix = luci.sys.exec("uci get amlogic.config.amlogic_firmware_suffix 2>/dev/null") or default_firmware_suffix

default_firmware_config="1"
local amlogic_firmware_config = luci.sys.exec("uci get amlogic.config.amlogic_firmware_config 2>/dev/null") or default_firmware_config

default_kernel_path="n1/kernel"
local amlogic_kernel_path = luci.sys.exec("uci get amlogic.config.amlogic_kernel_path 2>/dev/null") or default_kernel_path
--SimpleForm for nil
m = SimpleForm("", "", nil)
m.reset = false
m.submit = false


--SimpleForm for Check
b = SimpleForm("amlogic", translate("在线下载更新"), nil)
b.description = translate("( 版本选择<多功能: lede > 、<自用1: zy1 > 、<自用2: zy2 >、<自用3: zy3 >、<自用5: zy5 >、<自用6: zy6 > )")
b.reset = false
b.submit = false

s = b:section(SimpleSection, "", "")


--1.Set OpenWrt Releases Tag Keywords
o = s:option(Value, "firmware_tag", translate("选择在线更新固件版本:"))
o.rmempty = true
o.default = amlogic_firmware_tag
o.write = function(self, key, value)
	if value == "" then
        --self.description = translate("Invalid value.")
        amlogic_firmware_tag = default_firmware_tag
	else
        --self.description = translate("OpenWrt Releases Tag Keywords:") .. value
        amlogic_firmware_tag = value
	end
end

--2.Restore configuration
o = s:option(Flag,"restore_config",translate("保留配置更新:"))
o.description = translate("选择是否保留配置更新")
o.rmempty = false
if tonumber(amlogic_firmware_config) == 0 then
    o.default = "0"
else
    o.default = "1"
end
o.write = function(self, key, value)
    if value == "1" then
        amlogic_firmware_config = "1"
    else
        amlogic_firmware_config = "0"
    end
end

--3.Save button
o = s:option(Button, "", translate("Save Config:"))
o.template = "amlogic/other_button"
o.render = function(self, section, scope)
	self.section = true
	scope.display = ""
	self.inputtitle = translate("Save")
	self.inputstyle = "apply"
	Button.render(self, section, scope)
end
o.write = function(self, section, scope)
	luci.sys.exec("uci set amlogic.config.amlogic_firmware_tag=" .. amlogic_firmware_tag .. " 2>/dev/null")
	luci.sys.exec("uci set amlogic.config.amlogic_firmware_config=" .. amlogic_firmware_config .. " 2>/dev/null")
	luci.sys.exec("uci commit amlogic 2>/dev/null")
	http.redirect(DISP.build_url("admin", "system", "amlogic", "check"))
	--self.description = "amlogic_firmware_repo: " .. amlogic_firmware_repo
end

b:section(SimpleSection).template  = "amlogic/other_check"

return m, b
