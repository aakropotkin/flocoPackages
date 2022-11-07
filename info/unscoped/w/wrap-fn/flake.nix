{

  inputs.packument.url   = "https://registry.npmjs.org/wrap-fn?rev=20-17e345e9c48a5bff3ac07cffcffca6b2";
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
    ident = "wrap-fn";
    ldir  = "info/unscoped/w/wrap-fn";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
