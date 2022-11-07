{

  inputs.packument.url   = "https://registry.npmjs.org/element-ui?rev=202-874d62618af8e2bd574eebe9cd3140e1";
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
    ident = "element-ui";
    ldir  = "info/unscoped/e/element-ui";
    inherit packument fetchInfo;
  } // latest';

}
