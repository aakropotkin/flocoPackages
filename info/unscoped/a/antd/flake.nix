{

  inputs.packument.url   = "https://registry.npmjs.org/antd?rev=928-bcb28ef168cb7115a4fdbd18ead9e469";
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
    ident = "antd";
    ldir  = "info/unscoped/a/antd";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
