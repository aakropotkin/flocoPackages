{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/punycode?_rev=123-ff5e28a7c75dad62d4172b62505e0b28";
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
    ident = "punycode";
    ldir  = "info/unscoped/p/punycode";
    inherit packument fetchInfo;
  } // latest';

}
