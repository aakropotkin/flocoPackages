{

  inputs.packument.url   = "https://registry.npmjs.org/ext?rev=26-bde93e10039563f9e931af590716e9e5";
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
    ident = "ext";
    ldir  = "info/unscoped/e/ext";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
