#!/usr/bin/env bash

#Variables globales
    PROGRAM="vimCfg.sh"
    VERSION="1.0"
    AUTHOR="Gabriel Reus"

#Funciones....

    function help(){
        echo -e "${PROGRAM} v${VERSION} by ${AUTHOR}"
        echo -e "\t -i | --install:\t Install vim"
        echo -e "\t -u | --uninstall:\t Uninstall vim"
        echo -e "\t -c | --config:\t\t Copies the config to .vimrc and vim folder"
        echo -e "\t -r | --removeConfig:\t Removes the config, file .vimrc and vim folder"
        echo -e "\t -h | --help:\t\t show this Help"
    }

    #Instalamos vim
    function install(){
        sudo apt update
        sudo apt install vim
    }

    #Copiamos la config de Gabriel
    function config(){
        
        #Creamos las carpetas base...
        echo -e "Creating vim folders..."
        mkdir -p ~/.vim ~/.vim/autoload ~/.vim/backup ~/.vim/colors ~/.vim/plugged

        
        #Creamos el fichero rc
        echo -e "Copying .vimrc file..."
        cp ./resources/.vimrc ~/.vimrc

        #Install vim plugin manager
        #curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        #    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    }

    function uninstall(){
        echo -e "Uninstalling vim..."
        sudo apt remove vim
        echo -e "vim UNINSTALLED..."
    }

    function removeConfig(){
        echo -e "Removing .vim folder..."
        rm -rf ~/.vim
        echo -e "Removing .vimrc file..."
        rm ~/.vimrc
    }

#Logica

    #echo "VIM cfg Manager"

    for i in "$@"; do
        case $i in 
            -i|--install)
                install
                shift
            ;;
            -u|--uninstall)
                uninstall
                shift
            ;;
            -c|--config)
                config
                shift
            ;;
            -r|--removeConfig)
                removeConfig
                shift
            ;;
            -h|--help)
                help
                exit 1
                shift
            ;;
            -*|--*)
                echo "Unknown option $i"
                exit 1
            ;;
            *)
            ;;
        esac
    done

   
#echo "END"