{

  inputs.packument.url   = "https://registry.npmjs.org/ecc-jsbn?rev=12-839c7f44abb9a3fd259247f4e7f20fa9";
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
    ident = "ecc-jsbn";
    ldir  = "info/unscoped/e/ecc-jsbn";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
