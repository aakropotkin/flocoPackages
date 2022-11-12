{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@nodelib/fs.stat?_rev=13-f02a81b3fbc824969acbe9dd524c1677";
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
    scope = "@nodelib";
    ident = "@nodelib/fs.stat";
    ldir  = "info/nodelib/fs.stat";
    inherit packument fetchInfo;
  } // latest';

}
