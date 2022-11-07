{

  inputs.packument.url   = "https://registry.npmjs.org/bin-links?rev=51-60d1493c811d161faaab7deaac186b9e";
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
    ident = "bin-links";
    ldir  = "info/unscoped/b/bin-links";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
