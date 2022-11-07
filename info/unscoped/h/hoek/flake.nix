{

  inputs.packument.url   = "https://registry.npmjs.org/hoek?rev=326-246e5268440874baa958191aeb14d042";
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
    ident = "hoek";
    ldir  = "info/unscoped/h/hoek";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
