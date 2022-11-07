{

  inputs.packument.url   = "https://registry.npmjs.org/jsonpath-plus?rev=45-0a877fa81a19e94bc7ee33a700ced73b";
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
    ident = "jsonpath-plus";
    ldir  = "info/unscoped/j/jsonpath-plus";
    inherit packument fetchInfo;
  } // latest';

}
