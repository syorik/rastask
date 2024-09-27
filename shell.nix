{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    flutter
    dart
    clang
    cmake
    ninja
    pkg-config
    gtk3
    pcre
    dbus
    libepoxy
    xorg.libX11
    xorg.libXcursor
    xorg.libXrandr
    xorg.libXi
  ];

  shellHook = ''
    export LD_LIBRARY_PATH="${pkgs.lib.makeLibraryPath [
      pkgs.gtk3
      pkgs.pcre
      pkgs.dbus
      pkgs.libepoxy
      pkgs.xorg.libX11
      pkgs.xorg.libXcursor
      pkgs.xorg.libXrandr
      pkgs.xorg.libXi
    ]}"
  '';
}
