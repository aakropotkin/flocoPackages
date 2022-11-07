{

  inputs.packument.url   = "https://registry.npmjs.org/@fluentui/react-component-ref?rev=91-7a9f5f1296efb53b4fb0183c362172a6";
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
    scope = "@fluentui";
    ident = "@fluentui/react-component-ref";
    ldir  = "info/fluentui/react-component-ref";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
