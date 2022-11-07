{

  inputs.packument.url   = "https://registry.npmjs.org/browserslist?rev=221-173feaab6dd9766a14e3944c4a0663eb";
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
    ident = "browserslist";
    ldir  = "info/unscoped/b/browserslist";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
