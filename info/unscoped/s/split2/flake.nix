{

  inputs.packument.url   = "https://registry.npmjs.org/split2?rev=45-cc5d38e6fac0ba182f189e6e2ba69eea";
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
    ident = "split2";
    ldir  = "info/unscoped/s/split2";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
