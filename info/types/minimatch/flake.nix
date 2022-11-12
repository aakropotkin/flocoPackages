{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@types/minimatch?_rev=596-f134f3cacd910e4942d10211e1b3215e";
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
    ident = "@types/minimatch";
    ldir  = "info/types/minimatch";
    inherit packument fetchInfo;
  } // latest';

}
