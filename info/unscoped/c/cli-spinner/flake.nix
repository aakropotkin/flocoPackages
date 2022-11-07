{

  inputs.packument.url   = "https://registry.npmjs.org/cli-spinner?rev=53-b966a9a85f6b8eed86f892f158deebd1";
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
    ident = "cli-spinner";
    ldir  = "info/unscoped/c/cli-spinner";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
