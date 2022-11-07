{

  inputs.packument.url   = "https://registry.npmjs.org/kew?rev=103-2ab4221ed69fd1b30206def00df7d2da";
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
    ident = "kew";
    ldir  = "info/unscoped/k/kew";
    inherit packument fetchInfo;
  } // latest';

}
