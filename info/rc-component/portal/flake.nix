{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@rc-component/portal?_rev=14-7b557adfe25cc71a9e8dc6decde2f09f";
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
    scope = "@rc-component";
    ident = "@rc-component/portal";
    ldir  = "info/rc-component/portal";
    inherit packument fetchInfo;
  } // latest';

}
