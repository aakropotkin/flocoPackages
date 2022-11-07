{

  inputs.packument.url   = "https://registry.npmjs.org/html-minifier?rev=233-757468d7422a16d9f6e589ea14f80ab7";
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
    ident = "html-minifier";
    ldir  = "info/unscoped/h/html-minifier";
    inherit packument fetchInfo;
  } // latest';

}
