{

  inputs.packument.url   = "https://registry.npmjs.org/https-proxy-agent?rev=52-9e1a43d04203c6d801c59b3a3028ed04";
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
    ident = "https-proxy-agent";
    ldir  = "info/unscoped/h/https-proxy-agent";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
