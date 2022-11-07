{

  inputs.packument.url   = "https://registry.npmjs.org/complex.js?rev=41-bca280d86f502ccdc47d39a3f2485174";
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
    ident = "complex.js";
    ldir  = "info/unscoped/c/complex.js";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
