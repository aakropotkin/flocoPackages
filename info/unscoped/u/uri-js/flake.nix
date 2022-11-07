{

  inputs.packument.url   = "https://registry.npmjs.org/uri-js?rev=25-8bf2adfb853e1727c50edcddf63bb57a";
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
    ident = "uri-js";
    ldir  = "info/unscoped/u/uri-js";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
