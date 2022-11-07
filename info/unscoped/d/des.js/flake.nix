{

  inputs.packument.url   = "https://registry.npmjs.org/des.js?rev=6-305a7c0604c68b3d02b095809b279435";
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
    ident = "des.js";
    ldir  = "info/unscoped/d/des.js";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
