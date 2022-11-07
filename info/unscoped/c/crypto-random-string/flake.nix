{

  inputs.packument.url   = "https://registry.npmjs.org/crypto-random-string?rev=21-60649d6c338787073a825a9564d3b69a";
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
    ident = "crypto-random-string";
    ldir  = "info/unscoped/c/crypto-random-string";
    inherit packument fetchInfo;
  } // latest';

}
