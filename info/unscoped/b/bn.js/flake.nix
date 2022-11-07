{

  inputs.packument.url   = "https://registry.npmjs.org/bn.js?rev=209-a1b279e70182c70ab707977231d04c48";
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
    ident = "bn.js";
    ldir  = "info/unscoped/b/bn.js";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
