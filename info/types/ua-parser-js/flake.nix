{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@types%2fua-parser-js?_rev=520-cf2781d2a16ee378cbffe994fe985ccc";
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
    ident = "@types/ua-parser-js";
    ldir  = "info/types/ua-parser-js";
    inherit packument fetchInfo;
  } // latest';

}
