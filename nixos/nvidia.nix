{ pkgs, config, libs, ... }:

{

 # Enable OpenGL
   hardware.opengl = {
    enable = true;
   };

   services.xserver.videoDrivers = ["nvidia"];
   
   hardware.nvidia = {
	modesetting.enable = true;
   	powerManagement.enable = false;
   	powerManagement.finegrained = false;
        open = false;
   	nvidiaSettings = false;
  	package = config.boot.kernelPackages.nvidiaPackages.beta; 
	};
}
