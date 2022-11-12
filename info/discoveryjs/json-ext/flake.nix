{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@discoveryjs/json-ext?_rev=16-3e6dbf86b76b596cb016e8d0fd6d3f01";
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
    scope = "@discoveryjs";
    ident = "@discoveryjs/json-ext";
    ldir  = "info/discoveryjs/json-ext";
    inherit packument fetchInfo;
  } // latest';

}
