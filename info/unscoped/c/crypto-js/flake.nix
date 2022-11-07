{

  inputs.packument.url   = "https://registry.npmjs.org/crypto-js?rev=221-af10126df372b774e62724586e0e4dad";
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
    ident = "crypto-js";
    ldir  = "info/unscoped/c/crypto-js";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
