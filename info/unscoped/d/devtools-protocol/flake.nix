{

  inputs.packument.url   = "https://registry.npmjs.org/devtools-protocol?rev=981-6de6c062da5b2336b56de5e4b4768777";
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
    ident = "devtools-protocol";
    ldir  = "info/unscoped/d/devtools-protocol";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
