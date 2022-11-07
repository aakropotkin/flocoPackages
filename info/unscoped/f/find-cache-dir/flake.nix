{

  inputs.packument.url   = "https://registry.npmjs.org/find-cache-dir?rev=21-6a58d31cadc0d64f6199ac3f5f5fa2a6";
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
    ident = "find-cache-dir";
    ldir  = "info/unscoped/f/find-cache-dir";
    inherit packument fetchInfo;
  } // latest';

}
