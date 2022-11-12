{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@intlify%2fmessage-compiler?_rev=104-ffe96e97f5f3b7f2e4fdb75ecb6a1090";
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
    ident = "@intlify/message-compiler";
    ldir  = "info/intlify/message-compiler";
    inherit packument fetchInfo;
  } // latest';

}
