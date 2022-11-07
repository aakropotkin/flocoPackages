{

  inputs.packument.url   = "https://registry.npmjs.org/proxy-from-env?rev=8-221f1e388c5297ad5bde7ca8a7fef2f7";
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
    ident = "proxy-from-env";
    ldir  = "info/unscoped/p/proxy-from-env";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
