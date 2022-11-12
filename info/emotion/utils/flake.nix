{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@emotion%2futils?_rev=38-104f0cec5ff53a9a438d565bc49c3e9a";
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
    scope = "@emotion";
    ident = "@emotion/utils";
    ldir  = "info/emotion/utils";
    inherit packument fetchInfo;
  } // latest';

}
