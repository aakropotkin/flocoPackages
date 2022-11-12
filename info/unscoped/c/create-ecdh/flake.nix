{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/create-ecdh?_rev=30-a852ca8ea011b971dcfec43a82b92814";
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
    ident = "create-ecdh";
    ldir  = "info/unscoped/c/create-ecdh";
    inherit packument fetchInfo;
  } // latest';

}
