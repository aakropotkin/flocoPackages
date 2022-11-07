{

  inputs.packument.url   = "https://registry.npmjs.org/html-element-map?rev=6-e671fc5cb5f3dc5e555cd2afe87e3a74";
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
    ident = "html-element-map";
    ldir  = "info/unscoped/h/html-element-map";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
