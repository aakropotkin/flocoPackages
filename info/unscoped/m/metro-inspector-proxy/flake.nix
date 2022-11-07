{

  inputs.packument.url   = "https://registry.npmjs.org/metro-inspector-proxy?rev=48-9a1af318bbe5a1abe174ee12c8acbdf9";
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
    ident = "metro-inspector-proxy";
    ldir  = "info/unscoped/m/metro-inspector-proxy";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
