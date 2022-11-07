{

  inputs.packument.url   = "https://registry.npmjs.org/node-sass?rev=610-5d0aecd5381846dce9ae6177dbb299c9";
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
    ident = "node-sass";
    ldir  = "info/unscoped/n/node-sass";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
