{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@intlify%2fcore-base?_rev=87-1ebdc728bf50e4a4ffad2b247eb7ad91";
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
    scope = "@intlify";
    ident = "@intlify/core-base";
    ldir  = "info/intlify/core-base";
    inherit packument fetchInfo;
  } // latest';

}
