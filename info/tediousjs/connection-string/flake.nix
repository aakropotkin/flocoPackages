{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@tediousjs%2fconnection-string?_rev=5-aaee67ddf8761d48a4e5b5a16bc11cc2";
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
    scope = "@tediousjs";
    ident = "@tediousjs/connection-string";
    ldir  = "info/tediousjs/connection-string";
    inherit packument fetchInfo;
  } // latest';

}
