{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@types%2fd3-dispatch?_rev=604-b8e695a3bf677cb748f70655a3592aef";
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
    scope = "@types";
    ident = "@types/d3-dispatch";
    ldir  = "info/types/d3-dispatch";
    inherit packument fetchInfo;
  } // latest';

}
