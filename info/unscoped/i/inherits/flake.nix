{

  inputs.packument.url   = "https://registry.npmjs.org/inherits?rev=96-2d2fde562b58e2cb5bfd1069f641434c";
  inputs.packument.flake = false;

  outputs = inputs: let
    importJSON = f: builtins.fromJSON ( builtins.readFile f );
    packument  = importJSON inputs.packument;
    fetchInfo  = if ! builtins.pathExists ./fetchInfo.json then {} else
                 importJSON ./fetchInfo.json;
    latest'    = if ! ( packument ? dist-tags.latest ) then {} else {
      latestVersion = packument.dist-tags.latest;
      latest        = packument.versions.${packument.dist-tags.latest};
    };
  in {
    scope = null;
    ident = "inherits";
    ldir  = "info/unscoped/i/inherits";
    inherit packument fetchInfo;
  } // latest';

}
