{

  inputs.packument.url   = "https://registry.npmjs.org/readline?rev=38-c5b65c0e06fc63d43fafbe062cfa95ef";
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
    ident = "readline";
    ldir  = "info/unscoped/r/readline";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
