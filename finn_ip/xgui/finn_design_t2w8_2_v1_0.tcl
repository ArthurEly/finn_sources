# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  ipgui::add_page $IPINST -name "Page 0"

  #Adding Page
  set _Clocks_ [ipgui::add_page $IPINST -name "_Clocks_"]
  ipgui::add_static_text $IPINST -name "clock_text" -parent ${_Clocks_} -text {Enter the target frequency for the input clock(s) for the IP.
These frequencies will be used during the default out-of-context synthesis flow}


}


