{

  inputs.packument.url   = "https://registry.npmjs.org/emoji-regex?rev=47-8f7ff4b949d7efb337d83a4d91b044ef";
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
    ident = "emoji-regex";
    ldir  = "info/unscoped/e/emoji-regex";
    inherit packument fetchInfo;
  } // latest';

}
