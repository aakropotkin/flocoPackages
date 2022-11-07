{

  inputs.packument.url   = "https://registry.npmjs.org/plist?rev=71-5e5a35be0233220ccf22467b72c2e774";
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
    ident = "plist";
    ldir  = "info/unscoped/p/plist";
    inherit packument fetchInfo;
  } // latest';

}
