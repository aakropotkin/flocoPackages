{

  inputs.packument.url   = "https://registry.npmjs.org/wide-align?rev=13-48fe08429a42d94fb03d4f83d4c5544a";
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
    ident = "wide-align";
    ldir  = "info/unscoped/w/wide-align";
    inherit packument fetchInfo;
  } // latest';

}
