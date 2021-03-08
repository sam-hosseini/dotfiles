function reinstall_command_line_tools
    set --local COMMAND_LINE_TOOLS_PATH /Library/Developer/CommandLineTools

    if test -e $COMMAND_LINE_TOOLS_PATH
        rm $COMMAND_LINE_TOOLS_PATH
    end

    xcode-select --install
end
