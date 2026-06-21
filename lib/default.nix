{ lib, ... }:
rec {
  listNixModules =
    dir:
    lib.pipe (builtins.readDir dir) [
      (lib.filterAttrs (name: type: !lib.hasPrefix "." name && (type == "directory" || lib.hasSuffix ".nix" name)))
      (lib.mapAttrsToList (name: _: lib.removeSuffix ".nix" name))
    ];

  createModuleEntryPoint =
    dir:
    let
      entries = lib.filterAttrs (name: _: !lib.hasPrefix "." name && name != "default.nix") (
        builtins.readDir dir
      );

      fileModules = lib.pipe entries [
        (lib.filterAttrs (name: type: type == "regular" && lib.hasSuffix ".nix" name))
        (lib.mapAttrs' (name: _: lib.nameValuePair (lib.removeSuffix ".nix" name) (dir + "/${name}")))
      ];

      dirModules = lib.pipe entries [
        (lib.filterAttrs (_: type: type == "directory"))
        (lib.mapAttrs (name: _: createModuleEntryPoint (dir + "/${name}")))
      ];

      modules = fileModules // dirModules;
    in
    modules // {
      default =
        { ... }:
        {
          imports =
            lib.attrValues fileModules
            ++ lib.mapAttrsToList (_: ns: ns.default) dirModules;
        };
    };
}
