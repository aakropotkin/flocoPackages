{

  inputs.packument.url   = "https://registry.npmjs.org/call-me-maybe?rev=11-34407b76718694748acd21fe9568ffe3";
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
    ident = "call-me-maybe";
    ldir  = "info/unscoped/c/call-me-maybe";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
