{

  inputs.packument.url   = "https://registry.npmjs.org/data-uri-to-buffer?rev=23-d920a8344acb191c8978510a1318b282";
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
    ident = "data-uri-to-buffer";
    ldir  = "info/unscoped/d/data-uri-to-buffer";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
