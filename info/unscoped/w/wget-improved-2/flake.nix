{

  inputs.packument.url   = "https://registry.npmjs.org/wget-improved-2?rev=1-a8387c8171809fc340bc6c99600e22e0";
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
    ident = "wget-improved-2";
    ldir  = "info/unscoped/w/wget-improved-2";
    inherit packument fetchInfo;
  } // latest';

}
